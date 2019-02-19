/*
 * Copyright (C) 2019 The Dirty Unicorns Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */

package com.aosip.support.preference;

import android.app.ListActivity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.aosip.support.R;

public class AppPicker extends ListActivity {

    protected PackageManager packageManager = null;
    protected List<ApplicationInfo> applist = null;
    Adapter listadapter = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(android.R.layout.list_content);

        packageManager = getPackageManager();
        new LoadApplications().execute();
    }

    protected void onListItemClick(ListView l, View v, int position, long id) {
        super.onListItemClick(l, v, position, id);

        finish();
    }

    private List<ApplicationInfo> checkForLaunchIntent(List<ApplicationInfo> list) {
        ArrayList<ApplicationInfo> applist = new ArrayList<>();

        // If we need to blacklist apps, this is where we list them
        String[] blacklist_packages = {
                "com.google.android.as", // Actions Services
                "com.google.android.GoogleCamera", // Google camera
                "com.google.android.imaging.easel.service", // Pixel Visual Core Service
                "com.android.traceur" // System Tracing (Google spyware lol)
        };

        for (ApplicationInfo info : list) {
            try {
                /* Remove blacklisted apps from the list of apps we give to
                   the user to select from. */
                if ((!Arrays.asList(blacklist_packages).contains(info.packageName)
                        && null != packageManager.getLaunchIntentForPackage(info.packageName))) {
                    applist.add(info);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Lets alphabatize the list of installed user apps
        Collections.sort(applist, new ApplicationInfo.DisplayNameComparator(packageManager));

        return applist;
    }

    class LoadApplications extends AsyncTask<Void, Void, Void> {

        @Override
        protected Void doInBackground(Void... params) {
            applist = checkForLaunchIntent(packageManager.getInstalledApplications(
                    PackageManager.GET_META_DATA));
            listadapter = new Adapter(AppPicker.this,
                    R.layout.app_list_item, applist);
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            setListAdapter(listadapter);
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }
    }

    class Adapter extends ArrayAdapter<ApplicationInfo> {

        private List<ApplicationInfo> appList;
        private Context context;
        private PackageManager packageManager;

        private Adapter(Context context, int resource, List<ApplicationInfo> objects) {
            super(context, resource, objects);

            this.context = context;
            this.appList = objects;
            packageManager = context.getPackageManager();
        }

        @Override
        public int getCount() {
            return ((null != appList) ? appList.size() : 0);
        }

        @Override
        public ApplicationInfo getItem(int position) {
            return ((null != appList) ? appList.get(position) : null);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;

            ApplicationInfo data = appList.get(position);

            if (view == null) {
                LayoutInflater layoutInflater = (LayoutInflater) context
                        .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = layoutInflater.inflate(R.layout.app_list_item, null);
            }

            if (data != null) {
                TextView appName = view.findViewById(R.id.app_name);
                ImageView iconView = view.findViewById(R.id.app_icon);

                appName.setText(data.loadLabel(packageManager));
                iconView.setImageDrawable(data.loadIcon(packageManager));
            }
            return view;
        }
    }
}
