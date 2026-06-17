import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { VideosComponent } from './pages/videos/videos.component';
import { SoundboxComponent } from './pages/soundbox/soundbox.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'videos', component: VideosComponent },
  { path: 'soundbox', component: SoundboxComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
